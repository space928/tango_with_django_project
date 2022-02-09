import re
from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.urls import reverse

# Import db models
from rango.models import Category, Page
from rango.forms import CategoryForm, PageForm

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

def add_category(request):
    form = CategoryForm()

    # Handle returned forms
    if request.method == 'POST':
        form = CategoryForm(request.POST)

        # Have we been provided with a valid form?
        if form.is_valid():
            # Save the new category to the database.
            form.save(commit=True)
            # Once we're done, go back to index
            return redirect('/rango/')
        else:
            # The supplied form contained errors,
            # just print them to the terminal.
            print(form.errors)

    # Will handle the bad form, new form, or no form supplied cases.
    # Render the form with error messages (if any).
    return render(request, 'rango/add_category.html', {'form': form})

def add_page(request, category_name_slug):
    try:
        category = Category.objects.get(slug=category_name_slug)
    except Category.DoesNotExist:
        category = None

    # You cannot add a page to a Category that does not exist...
    if category is None:
        return redirect('/rango/')

    form = PageForm()

    # Handle returned forms
    if request.method == "POST":
        form = PageForm(request.POST)

        # Validate form
        if form.is_valid():
            # Copy the form data
            page = form.save(commit=False)
            # Add the missing data
            page.category = category
            page.views = 0
            # Save to the db
            page.save()

            # Once we're done, go back to the category page
            return redirect(reverse('rango:show_category',
                                    kwargs={'category_name_slug': category_name_slug}))
        else:
            # Log any errors
            print(form.errors)

    # Render the form and any error messages
    context_dict = {'form': form, 'category': category}
    return render(request, 'rango/add_page.html', context=context_dict)
