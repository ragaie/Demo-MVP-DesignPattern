# This demo using MVP Desgin pattern :-

 All comuncation between layers done throw protocols.

 This demo contain only one screen showing list of dat form api, and show offline data when network down.

Layout not pretty one, i tried to maked it  as simple i can.

## Here how i organized folder inside demo:

1- Folder for storyboard files

2- Folder for service layer and end points

3- one for suporrting files and reusable code

4- one for caching layer and it is files

5- one for Scences, it is including folder for every screen --> inside every screen you find all files related to this screen 

start from view, presenter, file for protocals, entites, and cells file if screen have one.


## There is many another layer just for supporting demo app not compitable with real app.

1- service layer: it is native layer to request data, small to fit all cases of large application, it just small functionality for this demo.

2- cached layer: simple layer to cached data direct to json file witout making operation on saved data.

3- Checking Internet connection layer : NWPathMonitor  provided by apple to check interent connection.

4- also there no design pattern add to handel dependancies, it handled manual for every model, So for real app will handle it
by composstion root or Swinject or any other way, So dependancies handling not pretty one in this task.

5- No pattern added to handle 

# Have good time in checking it...

# Thanks.
