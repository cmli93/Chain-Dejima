package main
//此文件是用于读取dejima的数据的

import (
	"github.com/ethereum/go-ethereum/ethclient"
	"log"
	"dejimaContract/contracts"
	//"github.com/ethereum/go-ethereum/accounts/abi/bind"
	//"strings"
	"fmt"
  "github.com/ethereum/go-ethereum/common"
	//"os"
)

func main(){
	// connect to an ethereum node  hosted by infura
	blockchain, err := ethclient.Dial("https://rinkeby.infura.io/fYe8qCnWiM9gh&ZAXOVoff")

	if err != nil {
		log.Fatalf("Unable to connect to network:%v\n", err)
	}

	if err != nil {
		log.Fatalf("Failed to create authorized transactor: %v", err)
	}

	// Create a new instance of the InboxExample contract bound to a specific deployed contract
  contract, err :=contracts.NewMetadata(common.HexToAddress("0xc896527a6ddaa1a6bfdffe235f194898e06cade5"), blockchain)
	if err != nil {
		log.Fatalf("Unable to bind to deployed instance of contract:%v\n")
	}

	fmt.Println(contract.GrantPermission(nil))

	//发起一个transaction通知other sharing peers, 可在此处理，也可由总控Go处理
}
