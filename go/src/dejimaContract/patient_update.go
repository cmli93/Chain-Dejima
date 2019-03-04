package main
//此文件是用于写入dejima的数据的，之后可增加上对dejima的增删改查的工作

import (
	"github.com/ethereum/go-ethereum/ethclient"
	"log"
	"dejimaContract/contracts"
	"github.com/ethereum/go-ethereum/accounts/abi/bind"
	"strings"
	//"fmt"
  "github.com/ethereum/go-ethereum/common"
	//"os"
	"math/big"
)

const key  = `{"address":"736b60dfc85b7063c01ecf912e00cb83678d386e","crypto":{"cipher":"aes-128-ctr","ciphertext":"bfdeb55472e6c8cb8e66afe8750fdc552e528a38c10d7086019eb95c47e1c3ee","cipherparams":{"iv":"74bb205f49824b32288cd80939c700fd"},"kdf":"scrypt","kdfparams":{"dklen":32,"n":262144,"p":1,"r":8,"salt":"c8513996214101764419329d3ee88c63f00da87f266a62df8564644f5c2faba0"},"mac":"20fc17e359ab1d806401be82b911f5c5ac4ce042e0d2051f20757ac100f21db2"},"id":"1f3d0563-ba1a-420f-818b-000702f7fce1","version":3}`

func main(){
	// connect to an ethereum node  hosted by infura
	blockchain, err := ethclient.Dial("https://rinkeby.infura.io/fYe8qCnWi6TXZAXOVof9")

	if err != nil {
		log.Fatalf("Unable to connect to network:%v\n", err)
	}

	// Get credentials for the account to charge for contract deployments
	auth, err := bind.NewTransactor(strings.NewReader(key), "lichunmiao")

	if err != nil {
		log.Fatalf("Failed to create authorized transactor: %v", err)
	}

  contract, err :=contracts.NewMetadata(common.HexToAddress("0xc896527a6ddaa1a6bfdffe235f194898e06cade5"), blockchain)
	if err != nil {
		log.Fatalf("Unable to bind to deployed instance of contract:%v\n")
	}

  //此处需修改
	// contract.SetMetaOfSharedDejima(&bind.TransactOpts{
	// 	From:auth.From,
	// 	Signer:auth.Signer,
	// 	Value: nil,
	// }, "Hello From Mars")


  //this function modifies the contract and actually generate a new transacction.
	//As a result, we pass in a pointer to a TrasactOpts struct populated with the transaction authorization data.
	//It will take a few minutes for this transaction to be mined and be part of the blockchain.
	//Once it is mined and included in the blockchain,
	//we can retrieve the GrantPermission property from the deployed contract to see the updated value.
	contract.CheckUpdatePermission(&bind.TransactOpts{
		From:auth.From,
		Signer:auth.Signer,
		Value: nil,
	}, "dejima_doctandpati", big.NewInt(1)) //A user would like to modify the medicatio name (i.e., attributeNo is 1) in dejima table "dejima_doctandpati"
}
