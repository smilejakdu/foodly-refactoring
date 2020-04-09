import json
from .models import Review

from products.models import Product
from account.models  import User
from account.utils   import login_check

from django.views    import View
from django.http     import HttpResponse, JsonResponse

class ReviewView(View):
    @login_check
    def post(self, request, product_name):
        data   = json.loads(request.body)
        review = data.get('review', None)

        try:
            if Product.objects.filter(name=product_name).exists():
                if review:
                    Review(
                        user_id    = request.user.id,
                        review     = review,
                        product_id = Product.objects.get(name=product_name).id
                    ).save()

                    return HttpResponse(status=200)

        except User.DoesNotExist:
            return HttpResponse(status=400)

    @login_check
    def get(self, request, product_name):
        review_data = list(Review.objects.filter(product__name=product_name).values())
        return JsonResponse({"message": f"{review_data}"}, status=200)


class ReviewDetailView(View):
    @login_check
    def post(self, request, product_name, review_id):
        data = json.loads(request.body)
        review = data.get('review', None)
        product_id = Product.objects.get(name=product_name).id

        try:
            review_data = Review.objects.get(id=review_id, product_id=product_id, user_id=request.user.id)
            if review:
                review_data.review = review
                review_data.save()
                return JsonResponse({'message': "SUCCESS"}, status=200)

        except Review.DoesNotExist:
            return HttpResponse(status=400)

        except User.DoesNotExist:
            return HttpResponse(status=400)

    @login_check
    def delete(self, request, product_name, review_id):
        product_id = Product.objects.get(name=product_name).id

        try:
            review_data = Review.objects.get(id=review_id, user_id=request.user.id, product_id=product_id)
            review_data.delete()
            return JsonResponse({"message": "SECCESS"}, status=200)

        except Product.DoesNotExist:
            return HttpResponse(status=400)
