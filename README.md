# Introduction

This repository is build to help you to master your robot framework skills.

You can use it to practice alone or contact us to speed up you learning via our courses and workshops.

If you are interested, our experts can help you. Please visit our [website training section](https://www.tesena.com/en/training) where you can find the esential courses or contact us via email events@tesena.com to get special offers.

## Aout us

We are sotware testing company with headquarter in Prague, Czech Republic. We are a team of experts in software testing.

Our knowledge of Robot Framework preaty advanced. Several of our experts are working with Robot Framework since founded in 2013.

Apart from testing services, we also provide training for software testing (20+ course types, 600+ attendees in 2021). We have several courses for beginners and experts.

# Project setup

1. install [python](https://www.python.org/downloads/)
2. create a new virtual environment: `python3 -m venv venv`, or just `python -m venv venv`
3. activate the virtual environment: Ctrl+Shift+P > Python: Select Interpreter > .venv/bin/python
4. install dependencies: `pip install -r requirements.txt`

# Usefull links

## Robot Framework

- [Website](https://robotframework.org/)
- [Documentation](https://robotframework.org/robotframework/)
- [User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [GitHub](https://github.com/robotframework)

- [How To Write Good Test Cases](https://github.com/robotframework/HowToWriteGoodTestCases)

- [Community's code repository](https://github.com/MarketSquare) ... Requests, Db, Browser, etc.

## Basics

- [Variables](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#variables)
- [Set up / Tear down](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-setup-and-teardown)

## Libraries

### Selenium library

- pip instalation: https://pypi.org/project/robotframework-seleniumlibrary/
- GitHub: https://github.com/robotframework/SeleniumLibrary
- Documentation: https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

### Requests library

- pip instalation: https://pypi.org/project/robotframework-requests/
- GitHub: https://github.com/MarketSquare/robotframework-requests
- Documentation: https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html

### Sikuli

- pip installation: https://pypi.org/project/robotframework-SikuliLibrary/
- GitHub: https://github.com/rainmanwy/robotframework-SikuliLibrary
- Keyword documantation: http://rainmanwy.github.io/robotframework-SikuliLibrary/doc/SikuliLibrary.html

### WatchUI

- pip installation: https://pypi.org/project/WatchUI/
- GitHub: https://github.com/Tesena-smart-testing/WatchUI
- Keyword documantation: https://tesena-smart-testing.github.io/WatchUI/rf_documentation/

### Image Horizon Library

- pip installation: https://pypi.org/project/robotframework-imagehorizonlibrary/
- GitHub: https://github.com/Eficode/robotframework-imagehorizonlibrary
- Keyword documantation: https://eficode.github.io/robotframework-imagehorizonlibrary/doc/ImageHorizonLibrary.html

# Test execution from command line

`--variable` (-v) – set up individual variables passing into script

`--tests` (-t) – select test to execute by name

`--include` (-i) – select test to execute by tag

`--exclude` (-e) – select test to NOT to execute by tag

`--outputdir` (-d) – defines the output directory for reports

Example:

`robot --variable ENV:INT --tests „New*“ --exclude db --outputdir ./Reports contracts.robot`

More info here:
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#command-line-options-for-test-execution
