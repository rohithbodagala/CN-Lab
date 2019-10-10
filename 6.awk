BEGIN{
        FTPPackets=0;
        cbrPackets=0;
        FTPSize=0;
        cbrSize=0;
}
{
        event=$1;
        packetType=$5;
        packetSize=$6;
        if(event=="r" && packetType=="tcp")
        {
                FTPPackets++;
                FTPSize=packetSize;
        }
        if(event=="r" && packetType=="cbr")
        {
               cbrPackets++;
               cbrSize=packetSize; 
        }
}
END{
        totalFTP=FTPPackets*FTPSize;
        totalCBR=cbrPackets*cbrSize;
        printf("The throughput of FTP application is %d Bytes per second\n",totalFTP/123.0);
        printf("The throughput of CBR application is %d Bytes per second\n",totalCBR/124.4);
}
