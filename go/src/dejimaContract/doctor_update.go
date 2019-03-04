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
