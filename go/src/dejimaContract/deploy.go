package main

import (
	"github.com/ethereum/go-ethereum/ethclient"
	"log"
	"dejimaContract/contracts"
	"github.com/ethereum/go-ethereum/accounts/abi/bind"
	"strings"
	"fmt"
	//"os"
)

const key  = `{"address":"cdce1eae7080f2450ea4f8637da5ce21f31718ac","crypto":{"cipher":"aes-128-ctr","ciphertext":"1ef7fc0dd14d308d77f980cf9fe84b0373d05168e1f86b353913403767617a79","cipherparams":{"iv":"c7bec440e663bde81c80f81a9e92a44f"},"kdf":"scrypt","kdfparams":{"dklen":32,"n":262144,"p":1,"r":8,"salt":"0c4e7148c7a553e6dac507e1b3d5604c4f5015e0cca74503bb3b079b34b6791f"},"mac":"a80c7aed9d1811cfe02bc8b29639567e8b001cbf472725eefd0f21f0a2debde0"},"id":"7274bf32-9931-4476-99c6-c92025ab7a2e","version":3}`

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
  //DeployInboxExample是inbox.go中的一个function，之前这个文件是abigen生成的
	address, _, _, _:= contracts.DeployMetadata(
		auth,
		blockchain,
	)

	fmt.Printf("Contract pending deploy: 0x%x\n", address)}
