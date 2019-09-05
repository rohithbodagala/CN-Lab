BEGIN{
	totalSent=0;
	totalReceived=0;
	totalLost=0;
}
{
	event=$1;
	packetType=$5;
	if(packetType=="cbr")
	{
	    if(event=="+")
	        totalSent++;
	    else if(event=="r")
	        totalReceived++;
		if(event=="d")
			totalLost++;
	}
}
END{
	printf("Total Received: %d\n",totalReceived);
	printf("Total Dropped: %d\n",totalLost);
}
