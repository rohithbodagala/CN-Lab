BEGIN{
        TCPPacketsRec=0;
        UDPPacketsRec=0;
        TCPPacketsDrop=0;
        UDPPacketsDrop=0;
}
{
        event=$1;
        packetType=$5;
        if(event=="r")
        {
                if(packetType=="tcp")
                        TCPPacketsRec++;
                else if(packetType=="cbr")
                        UDPPacketsRec++;
        }
        else if(event=="d")
        {
                if(packetType=="tcp")
                        TCPPacketsDrop++;
                else if(packetType=="cbr")
                        UDPPacketsDrop++;
        }
}
END{
        printf("\nTCP: Recieved : %d\t Dropped:%d",TCPPacketsRec,TCPPacketsDrop);
        printf("\nUDP: Recieved : %d\t Dropped: %d\n",UDPPacketsRec,UDPPacketsDrop);
}
