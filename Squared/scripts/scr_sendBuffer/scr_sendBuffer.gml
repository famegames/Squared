/// @function scr_sendBuffer
/// @description: send the buffer to the specified client
/// @argument ip given, because ip needs to be found to check client state
/// @argument index client index in the parallel arrays
/// @argument buffer buffer with information to send

// set input
var ip = argument0;
var index = argument1;
var buffer = argument2;

// get other needed parameters for sending
var socket = server;
var port = ds_list_find_value(portList, index);

// get the network player for debug
var inst = ds_map_find_value(Clients, ip);
inst.socketOut = socket;

// update to the clients specific sequence out
buffer_seek(buffer, buffer_seek_start, 1);
var sequenceOut = sequenceOuts[| index];
buffer_write(buffer, buffer_u8, sequenceOut);
buffer_seek(buffer, buffer_seek_end, 0);
sequenceOuts[| index] = scr_incrementInBounds(sequenceOut, 1, 0, SEQUENCE_MAX, true);

// send message
inst.messageSuccess = network_send_udp(socket, ip, port, buffer, buffer_tell(buffer));