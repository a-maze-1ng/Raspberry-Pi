https://www.reddit.com/r/pihole/comments/nmtwmq/is_there_any_way_to_have_pihole_dish_out_an/

http://pi.hole/admin/api.php?disable&auth=APITOKEN
Replace APITOKEN with your own token which you can get from "Settings, API/Web Inteface, Show API Token".
Replace 300 with whatever value you want to disable blocking for in seconds.
If you want to use that link from a client which isnt using Pihole as its own DNS, replace pi.hole in the link with the IP address.
The downside of this approach is that it will disable Pihole's blocking for all clients.