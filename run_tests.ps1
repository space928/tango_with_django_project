if($args.count -gt 0) {
    $test = $args[0]
} else {
    $test = Read-Host "Enter test number to run"
}

Write-Output "Downloading test from github..."
Write-Output "URL: https://github.com/tangowithcode/tango_with_django_2_code/raw/master/progress_tests/tests_chapter${test}.py"
Invoke-WebRequest "https://github.com/tangowithcode/tango_with_django_2_code/raw/master/progress_tests/tests_chapter${test}.py" -OutFile "rango\tests_chapter${test}.py"

Write-Output "Running test..."
python manage.py test rango.tests_chapter$test

Write-Output "Tidying up..."
Remove-Item rango\tests_chapter${test}.py