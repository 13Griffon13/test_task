# test_task_1

a test task

## Commands
Generate freezed classes and routes
dart run build_runner build --delete-conflicting-outputs

## Comments
App features contains separated data and app level, witch allows app run the same independently fom 
the API we using. Using dio to perform network requests. Error handling done with the help 
of dartz library which allows us to return Either type to our app-level logic, and then make a 
decision on what to do. State management is done via Cubit as it just faster to work with then bloc,
and more practical for this type of apps. Also to implement comfortable search rxdart was added to 
use .debounceTime(...) instead of timer.(solution with debounce looks most elegant in my eyes, but
I'm acknowledge that there are quite a few way to achieve this without rx)
