/// @function scr_connectClient
/// @description "connects" a clinet by adding networking details to a running list

// Get the IP and port that the socket comes from
var ip = ds_map_find_value(async_load, "ip");
var port = ds_map_find_value(async_load, "port");

// Connecting
// check if this client is already connected
if !(ds_map_exists(Clients, ip)) {
    // add client to our list of connected clients
    ds_list_add(ipList, ip);
    ds_list_add(portList, port);
    ds_list_add(sequenceOuts, 0);
    ds_list_add(sequenceOutQueues, ds_map_create());

    // Create a new player, and pick a random colour for that player        
    var inst = instance_create_layer(0, 0, "instances", obj_networkPlayer);
    inst.ip = ip;
	inst.connectIndex = playerTotal++;
    
    //inst.image_blend = ColourArray[colourindex];
    //colourindex = (colourindex+1) & 15;

    // put this instance into a map, using the ip as the lookup
    ds_map_add(Clients, ip, inst);
        
    // send confirmation message to client
    ds_map_add(clientMessages, ip, SERVER_CONNECT);
    }
// Disconnecting handled in obj_networkPlayer