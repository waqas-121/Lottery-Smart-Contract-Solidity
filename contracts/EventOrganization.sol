// SPDX-License-Identifier:MIT
pragma solidity 0.8.7;  

contract EventContract
{
    struct Event{

    address organizerAddress;
    string eventName;
    uint eventDate;
    uint ticketPrice;
    uint totalTicket;
    uint remaingTicket;
    }
    // uint is key (index) here Event is point to the struct which is define above
    mapping(uint=>Event)public events;
    // address is key then first uint is also a key while 2nd uint is # of tickets in quantity
    mapping(address=>mapping(uint=>uint))public ticket;
    //create an eventId in meaning of index/counts ,such that there has many events
    // here show the total no of events
    uint public eventId;


    // this function for event organization 
    
    function createEvent(string memory eventName,uint eventDate,uint ticketPrice,uint totalTicket) public{
        //check that event organization not set false time
        //means organizer wants to held an event at 28 july while the present date is 29 july
        //so it is big mistake ,here this line solve problem
        require(eventDate>block.timestamp,"You can organize event for future" );
        //if organizer create an event but not to create any tickets ,so this is 2nd problem,this line solve that problem
        require(totalTicket>0,"You can organize only if you create more than 0 tickets");
        //if all things are clear then on specific eventId ,we save all the information by help of structure
        //here two times write totalTicket ,when event organize total no of tickets eqals to remaing tickets that is why 
        //msg.sender => This variable refers to the address of the person (or smart contract) who called the current function
        //means the organizer. We also defined this is in struct as organizerAddress  
        events[eventId]=Event(msg.sender,eventName,eventDate,ticketPrice,totalTicket,totalTicket);
        eventId++;
    }
    // Here "id" is reffers to eventId
    // first to check event is exist or not
    //if true then check time of event
    // quantity is reffers to how many tickets you buy 
    //payable use because of in this fuction some wei is transfer
    function buyTicket(uint id,uint quantity)public payable{
        
        // if buyer wants to buy tickets of web3 seminar ,first we check exist or not
        require(events[id].eventDate!=0,"This event does not exist");
        //if exist then check how times left 
        require(block.timestamp<events[id].eventDate,"Event is cloesd ");
        // buyer wants to buy more than 1 ticket then first to check
        //they have monney or not 
        require(msg.value==events[id].ticketPrice*quantity,"Ether is not enough");
        // last thing is that how many tickets remaing
        //and how many tickets want user,if buyer tickets quantity less than remaing tickets then
        // this line will complete their command and go to the next line 
        require(events[id].remaingTicket>=quantity,"Not enough tickets");
        //lastly we upadte remaing tickets 
        events[id].remaingTicket-=quantity;
        // in line # 18 ,we create a mapping , msg.sender means buyer address 
        //id means specific event 
        //we store # of tickets 
        ticket[msg.sender][id]+=quantity;
    }

    //if you want to transfer ticket from your account to other person
    //id means specific event 
    function transferTicketToOthersPerson(uint id,uint quantity,address otherPerson)public{
        // first 2 line same as buyTicket fuction
        require(events[id].eventDate!=0,"This event does not exist");
        require(block.timestamp<events[id].eventDate,"Event is cloesd ");
        //check sender have tickets more then/equals to trasnfer or not
        require(ticket[msg.sender][id]>=quantity,"You do not have enough tickets");
        //update quantity in their storage
        ticket[msg.sender][id]-=quantity;
        //set quantity to other person storage
        ticket[otherPerson][id]=quantity;
    
    }


} 
