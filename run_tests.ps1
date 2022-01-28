# Download the tests from github and run them
Write-Output "Downloading tests from github..."
Invoke-WebRequest https://github.com/tangowithcode/tango_with_django_2_code/raw/master/progress_tests/tests_chapter3.py -OutFile rango\tests_chapter3.py
Invoke-WebRequest https://github.com/tangowithcode/tango_with_django_2_code/raw/master/progress_tests/tests_chapter4.py -OutFile rango\tests_chapter4.py
Invoke-WebRequest https://github.com/tangowithcode/tango_with_django_2_code/raw/master/progress_tests/tests_chapter5.py -OutFile rango\tests_chapter5.py
Invoke-WebRequest https://github.com/tangowithcode/tango_with_django_2_code/raw/master/progress_tests/tests_chapter6.py -OutFile rango\tests_chapter6.py
Invoke-WebRequest https://github.com/tangowithcode/tango_with_django_2_code/raw/master/progress_tests/tests_chapter7.py -OutFile rango\tests_chapter7.py
Invoke-WebRequest https://github.com/tangowithcode/tango_with_django_2_code/raw/master/progress_tests/tests_chapter8.py -OutFile rango\tests_chapter8.py
Invoke-WebRequest https://github.com/tangowithcode/tango_with_django_2_code/raw/master/progress_tests/tests_chapter9.py -OutFile rango\tests_chapter9.py
Invoke-WebRequest https://github.com/tangowithcode/tango_with_django_2_code/raw/master/progress_tests/tests_chapter10.py -OutFile rango\tests_chapter10.py

function TidyUp {
    Write-Output "Tidying up test files..."
    Remove-Item rango\tests_chapter3.py
    Remove-Item rango\tests_chapter4.py
    Remove-Item rango\tests_chapter5.py
    Remove-Item rango\tests_chapter6.py
    Remove-Item rango\tests_chapter7.py
    Remove-Item rango\tests_chapter8.py
    Remove-Item rango\tests_chapter9.py
    Remove-Item rango\tests_chapter10.py
}

Write-Output "Running chapter 3 tests..."
python manage.py test rango.tests_chapter3

$continue = Read-Host "Run next chapter tests? (y/n)"
if($continue -eq "y")
{
    Write-Output "Running chapter 4 tests..."
    python manage.py test rango.tests_chapter4
} else 
{
    TidyUp
    return
}

$continue = Read-Host "Run next chapter tests? (y/n)"
if($continue -eq "y")
{
    Write-Output "Running chapter 5 tests..."
    python manage.py test rango.tests_chapter5
} else 
{
    TidyUp
    return
}

$continue = Read-Host "Run next chapter tests? (y/n)"
if($continue -eq "y")
{
    Write-Output "Running chapter 6 tests..."
    python manage.py test rango.tests_chapter6
} else 
{
    TidyUp
    return
}

$continue = Read-Host "Run next chapter tests? (y/n)"
if($continue -eq "y")
{
    Write-Output "Running chapter 7 tests..."
    python manage.py test rango.tests_chapter7
} else 
{
    TidyUp
    return
}

$continue = Read-Host "Run next chapter tests? (y/n)"
if($continue -eq "y")
{
    Write-Output "Running chapter 8 tests..."
    python manage.py test rango.tests_chapter8
} else 
{
    TidyUp
    return
}

$continue = Read-Host "Run next chapter tests? (y/n)"
if($continue -eq "y")
{
    Write-Output "Running chapter 9 tests..."
    python manage.py test rango.tests_chapter9
} else 
{
    TidyUp
    return
}

$continue = Read-Host "Run next chapter tests? (y/n)"
if($continue -eq "y")
{
    Write-Output "Running chapter 10 tests..."
    python manage.py test rango.tests_chapter10
} else 
{
    TidyUp
    return
}