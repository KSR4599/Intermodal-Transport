pragma solidity >=0.4.22 <0.6.0;
contract Swift {
    
        struct Shipment {
   string class;
   uint containerid;
   uint shipmentid;
   address owner;
   string contents;
   uint weight;
   string pickup;
   string destination;
   string status;
     }

        uint classicWeight; 
        uint chb = 1000;
        uint cbh = 1000;
        uint cbhid =1;
        uint chc = 1000;
        uint chcid =1;
        uint[3] chbwt;
        uint[3] cbhwt;
        uint[1] chcwt;
        
        
        mapping (uint => Shipment) Classic;
    
        
        
        
     function addToClassic(string memory _contents, uint _weight,string memory _pickup, string memory _destination) public returns(uint){
          
            if(keccak256(abi.encodePacked(_pickup)) == keccak256("Hyd") && keccak256(abi.encodePacked(_destination)) == keccak256("Bang")){
                
            for(uint i=0;i <3;i++){
                if(chbwt[i] + _weight <1000){
          address owner = msg.sender;
          uint random = uint(keccak256(abi.encodePacked(now, msg.sender, _contents)))%1000000000;
           Shipment memory shipment = Shipment("Classic", i,random, owner, _contents, _weight, _pickup, _destination, "In transit");
          Classic[random] = shipment;
          chbwt[i] = chbwt[i]+ _weight;
         return chbwt[i];
          } 
            }
           
            }
            
             if(keccak256(abi.encodePacked(_pickup)) == keccak256("Bang") && keccak256(abi.encodePacked(_destination)) == keccak256("Hyd")){
                
            for(uint i=0;i <3;i++){
                if(cbhwt[i] + _weight <1000){
          address owner = msg.sender;
          uint random = uint(keccak256(abi.encodePacked(now, msg.sender, _contents)))%1000000000;
           Shipment memory shipment = Shipment("Classic", i,random, owner, _contents, _weight, _pickup, _destination, "In transit");
          Classic[random] = shipment;
         cbhwt[i] = cbhwt[i]+ _weight;
           return cbhwt[i];
          } 
            }
         
            }
            
                  if(keccak256(abi.encodePacked(_pickup)) == keccak256("Hyd") && keccak256(abi.encodePacked(_destination)) == keccak256("Che")){
                
      
                if(chcwt[0] + _weight <1000){
          address owner = msg.sender;
          uint random = uint(keccak256(abi.encodePacked(now, msg.sender, _contents)))%1000000000;
           Shipment memory shipment = Shipment("Classic", 0,random, owner, _contents, _weight, _pickup, _destination, "In transit");
          Classic[random] = shipment;
          chcwt[0] = chcwt[0]+ _weight;
        return chcwt[0];
          } 
            
            }
         
            return 0;
            }

}