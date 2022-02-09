from django.shortcuts import render
from django.http import HttpResponse

# Import db models
from rango.models import Category, Page

def index(request):
    # Query the database for all the categories stored. 
    # Order the results by number of likes and take the top 5.
    category_list = Category.objects.order_by('-likes')[:5]
    page_list = Page.objects.order_by('-views')[:5]

    # Context for the html template
    context_dict = {}
    context_dict["boldmessage"] = 'Crunchy, creamy, cookie, candy, cupcake!'
    context_dict["categories"] = category_list
    context_dict["pages"] = page_list

    # Render the web page
    return render(request, "rango/index.html", context=context_dict)

def about(request):
    return render(request, "rango/about.html")

def show_category(request, category_name_slug):
    context_dict = {}

    try:
        # Try and find a category which matches the slug
        category = Category.objects.get(slug=category_name_slug)

        # Find all the associated pages
        pages = Page.objects.filter(category=category)

        context_dict["pages"] = pages
        context_dict["category"] = category
    except Category.DoesNotExist:
        context_dict["pages"] = None
        context_dict["category"] = None

    return render(request, "rango/category.html", context=context_dict)
