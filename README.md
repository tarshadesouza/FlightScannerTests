# FlightScannerTests

# Introduction 
Hey there thanks for taking a look at my coding test! Heres a few things to know about the way I have chosen to set up this project.

## Dependencies
- Alamofire version 5.2 pinned

#### A little info behind my choices of Libraries

-Alamofire: Likewise, usually in projects, I am used to using wrappers of Alamofire. And on the odd occasion URLSession. Its a well mainted Lib so Im not to worried about this decision.

For parsing I have chosen to use Codable and not any third party libraries.

## Flow & Architecture
### Design Pattern
This project is made using clean architecture in particular I am using a clean-swift design templated, I chose this mainly because I wanted to experiment more with the implications of clean-swift. I prefer VIPER as I find it a little difficult in clean-swift keeping the View clear from alot of business logic, however I do believe that there are some rather large advantages working with clean-swift and testing was one of them. I also chose XIB´s instead of storyboards because I feel they are far more maintainable when your working as a team and even sometimes alone. 

### Flow
Flow of this app is very simple. Simply fill out the form on the first view and the search for flights!

## Tests
### XCUnitTest
I have written a total of 8 tests which gives me a total of 85% of test coverage. All the tests were geared towards making sure that business logic is behaving as it should. This way in the future if I change an important part of my business logic I should get a failed test.

As For the UITests, Im afraid I didn´t have enough time to do any. For developing I prefer to use Unit tests and a UITest is quite similar to a QA using Appium so for me I find that unit tests are more important for a reliable code base, I have also found that UITests take quite a long time to load and execute.

Thanks again for taking you time to look all of this over. And any feedback is welcomed!
