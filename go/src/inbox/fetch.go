package main

import (
	"github.com/ethereum/go-ethereum/ethclient"
	"log"
	"inbox/contracts" //contracts package
	"fmt"
	"github.com/ethereum/go-ethereum/common"
)


func main(){
	// connect to an ethereum node  hosted by infura
	blockchain, err := ethclient.Dial("https://rinkeby.infura.io/fYe8qCnWiM9gh&ZAXOVoff")

	if err != nil {
		log.Fatalf("Unable to connect to network:%v\n", err)
	}

	// Create a new instance of the InboxExample contract bound to a specific deployed contract
  contract, err :=contracts.NewInboxExampleCaller(common.HexToAddress("0xb19f19d604F7081b8480C03BB666BAf2bBC21aF1"), blockchain)
	if err != nil {
		log.Fatalf("Unable to bind to deployed instance of contract:%v\n")
	}

	fmt.Println(contract.Message(nil))

}
