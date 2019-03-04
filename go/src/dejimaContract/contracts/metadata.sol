pragma solidity ^0.5.4;
pragma experimental ABIEncoderV2;
//需要Chain-Dejima Metadata 中列出各个shared table的实际实现的metadata
//=================此contract的实现与paper中的略有不同，以本实现为准=================

//原型阶段此contract只考虑某个user更新shared table中某个attribute
contract Metadata {

    //Model metadata of EMR
    struct metaOfSharedDejima{
      string dejimaName;

      address[] sharingPeersAddressCollection;

      // dynamic list of length 2 bools
      bool[2][4] writePermission; //index starts from 0

      string lastUpdateTime ;
      //can be get automatically later (time在solidity)
    }

    bool public grantPermission; //default value for bool is false, 默认不授予权限

    //paper中的authorityToChangePermission的角色，默认是部署这个contract的人，现在暂时将4个dejima的
    address public owner; //The user who deplyed this contract，只有owner可以修改其他users的存取权限

    metaOfSharedDejima public dejima;//先考虑1个contract只有一个dejima

    //metaOfSharedDejima[] public metaCollectionOfSharedDejima; //各个dejima的数据以具体实现为准
    //（对医生而言，所有dejima的metadata的collection（prototype中只有两个dejima，D31和D32）

    /*
     * Contructor, will run whenever we deploy the contract to the blockchain
     * (initialized contract upon migration)
     * same name as the contract
    */
    constructor() public {
        //需要初始化contract中的vars。考虑是否可用Go来传参实现初始化
        owner = msg.sender; //部署这个contract的人可以是doctor，即authority to change permission
        grantPermission = false;

        //数组赋值和结构体赋值有问题
        //先把元素准备好，然后初始化结构体

        address[] memory sharingPeersAddressCollection = new address[](2);
        sharingPeersAddressCollection[0] = 0xCDce1eaE7080f2450ea4f8637DA5ce21f31718aC; //chunmiao account, act as doctor
        sharingPeersAddressCollection[1] = 0x736b60dFc85B7063c01ECf912E00cb83678D386e; //lucy account, act as patient

        /* prototype阶段仅仅考虑update
        update permission on d31_doctandpati shared attributes:

          Update          |  0. Doctor   |   1. Patient
        -----------------------------------------------
        0. PATIENTID 188  |  false       |     false
        1. MEDICATIONNAME |  t           |     false
        2. CLINICALDATA   |  t           |     t
        3. DOSAGE         |  t           |     t

        writePermission[1,0]为true，表示Doctor有更新medicationName的权限
        writePermission[1,1]为false，表示Patient没有更新medicationName的权限

        */
        bool[2][4] memory writePermission = [[false,false], [true,false], [true,true], [true,true]];
        //4行2列的数组

        dejima = metaOfSharedDejima("dejima_doctandpati", sharingPeersAddressCollection,
                                                writePermission, "20190221");

        /* metaCollectionOfSharedDejima = new metaOfSharedDejima[](1);
        metaCollectionOfSharedDejima[0] = dejima; */
    }

    //乖乖把所有的参数以最小粒度传递, 此函数用于建立一个新的dejima的entry
    /* function setMetaOfSharedDejima(string memory _dejimaName, address[2] memory _sharingPeersAddressCollection,
                                   bool[2][] memory _writePermission, string memory _lastUpdateTime) public {

      /* 构建一个dejima的metadata */
      /* metaOfSharedDejima memory dejima;

      dejima.dejimaName = _dejimaName;

      //数组的赋值方式
      for (uint i = 0; i < _sharingPeersAddressCollection.length; i++) {
            dejima.sharingPeersAddressCollection[i] = _sharingPeersAddressCollection[i];
            //example address: 0x36eaf79c12e96a3dc6f53426c
      }

      for(uint i = 0; i < _writePermission.length; i++)
        for(uint j = 0; j < 2; j ++)
          dejima.writePermission[i][j] = _writePermission[i][j];

      dejima.lastUpdateTime = _lastUpdateTime;

      metaCollectionOfSharedDejima.push(dejima);
    } */

    /* require(roles[msg.sender] == 1); //only a doctor can addEMRMetas now
    here msg.sender is an address, msg.sender to identify the address of who calling this function
    When you interact with a contract, you can know who interacts with the contracts by accessing msg.sender. */
    function checkUpdatePermission(string memory _dejimaName, uint _numOfAttriToBeUpdated) public{
      grantPermission = false;

      address senderAddr = msg.sender;

      /* 检查权限，满足就将grantPermission置为true */
      // 因为现在就一个dejima在系统里面，所以跳过了在metaCollectionOfSharedDejima找_dejimaName的过程,即默认访问的就是预设的dejima
      if(senderAddr == dejima.sharingPeersAddressCollection[0]) //caller is doctor
      {
        if (dejima.writePermission[_numOfAttriToBeUpdated][0] == true) //check permission on this attribute
           grantPermission = true;
      }
      else
       if(senderAddr == dejima.sharingPeersAddressCollection[1]) //caller is patient
        {
          if (dejima.writePermission[_numOfAttriToBeUpdated][1] == true) //check permission on this attribute
             grantPermission = true;
        }

      /* for (uint i = 1; i <= EMRMetasCount; i++)
      {
         if(EMRMetas[i].owner == _id)
                return (EMRMetas[i].owner, EMRMetas[i].timestamp, EMRMetas[i].allowedRole);
      }
      return (0,"0",0); //return id=0 if no result Meta found */
    }

    //update an existing medical metadata, suppose will change the allowedRole
    /* function modifyUpdatePermission(string memory newMessage) public {
      //判断当前user具有修改updatePermission的权限
      //if (owner != msg.sender) throw; //最好返回一个readable的错误提示信息
    } */
}
