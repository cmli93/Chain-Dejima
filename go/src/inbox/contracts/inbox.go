// Code generated - DO NOT EDIT.
// This file is a generated binding and any manual changes will be lost.

package contracts

import (
	"math/big"
	"strings"

	ethereum "github.com/ethereum/go-ethereum"
	"github.com/ethereum/go-ethereum/accounts/abi"
	"github.com/ethereum/go-ethereum/accounts/abi/bind"
	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/core/types"
	"github.com/ethereum/go-ethereum/event"
)

// Reference imports to suppress errors if they are not otherwise used.
var (
	_ = big.NewInt
	_ = strings.NewReader
	_ = ethereum.NotFound
	_ = abi.U256
	_ = bind.Bind
	_ = common.Big1
	_ = types.BloomLookup
	_ = event.NewSubscription
)

// InboxExampleABI is the input ABI used to generate the binding from.
const InboxExampleABI = "[{\"constant\":false,\"inputs\":[{\"name\":\"newMessage\",\"type\":\"string\"}],\"name\":\"setMessage\",\"outputs\":[],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"initialMessage\",\"type\":\"string\"}],\"name\":\"Inbox\",\"outputs\":[],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[],\"name\":\"message\",\"outputs\":[{\"name\":\"\",\"type\":\"string\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"}]"

// InboxExampleBin is the compiled bytecode used for deploying new contracts.
const InboxExampleBin = `0x608060405234801561001057600080fd5b506102f3806100206000396000f3fe608060405234801561001057600080fd5b506004361061005d577c01000000000000000000000000000000000000000000000000000000006000350463368b87728114610062578063d4a8d9ba14610062578063e21f37ce1461010a575b600080fd5b6101086004803603602081101561007857600080fd5b81019060208101813564010000000081111561009357600080fd5b8201836020820111156100a557600080fd5b803590602001918460018302840111640100000000831117156100c757600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600092019190915250929550610187945050505050565b005b61011261019e565b6040805160208082528351818301528351919283929083019185019080838360005b8381101561014c578181015183820152602001610134565b50505050905090810190601f1680156101795780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b805161019a90600090602084019061022c565b5050565b6000805460408051602060026001851615610100026000190190941693909304601f810184900484028201840190925281815292918301828280156102245780601f106101f957610100808354040283529160200191610224565b820191906000526020600020905b81548152906001019060200180831161020757829003601f168201915b505050505081565b828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f1061026d57805160ff191683800117855561029a565b8280016001018555821561029a579182015b8281111561029a57825182559160200191906001019061027f565b506102a69291506102aa565b5090565b6102c491905b808211156102a657600081556001016102b0565b9056fea165627a7a7230582007fa1a804ff810d8a76fc4367fe12422efd8a1f9b543d8e482f4c21f2871b4c00029`

// DeployInboxExample deploys a new Ethereum contract, binding an instance of InboxExample to it.
func DeployInboxExample(auth *bind.TransactOpts, backend bind.ContractBackend) (common.Address, *types.Transaction, *InboxExample, error) {
	parsed, err := abi.JSON(strings.NewReader(InboxExampleABI))
	if err != nil {
		return common.Address{}, nil, nil, err
	}
	address, tx, contract, err := bind.DeployContract(auth, parsed, common.FromHex(InboxExampleBin), backend)
	if err != nil {
		return common.Address{}, nil, nil, err
	}
	return address, tx, &InboxExample{InboxExampleCaller: InboxExampleCaller{contract: contract}, InboxExampleTransactor: InboxExampleTransactor{contract: contract}, InboxExampleFilterer: InboxExampleFilterer{contract: contract}}, nil
}

// InboxExample is an auto generated Go binding around an Ethereum contract.
type InboxExample struct {
	InboxExampleCaller     // Read-only binding to the contract
	InboxExampleTransactor // Write-only binding to the contract
	InboxExampleFilterer   // Log filterer for contract events
}

// InboxExampleCaller is an auto generated read-only Go binding around an Ethereum contract.
type InboxExampleCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// InboxExampleTransactor is an auto generated write-only Go binding around an Ethereum contract.
type InboxExampleTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// InboxExampleFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type InboxExampleFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// InboxExampleSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type InboxExampleSession struct {
	Contract     *InboxExample     // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// InboxExampleCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type InboxExampleCallerSession struct {
	Contract *InboxExampleCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts       // Call options to use throughout this session
}

// InboxExampleTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type InboxExampleTransactorSession struct {
	Contract     *InboxExampleTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts       // Transaction auth options to use throughout this session
}

// InboxExampleRaw is an auto generated low-level Go binding around an Ethereum contract.
type InboxExampleRaw struct {
	Contract *InboxExample // Generic contract binding to access the raw methods on
}

// InboxExampleCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type InboxExampleCallerRaw struct {
	Contract *InboxExampleCaller // Generic read-only contract binding to access the raw methods on
}

// InboxExampleTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type InboxExampleTransactorRaw struct {
	Contract *InboxExampleTransactor // Generic write-only contract binding to access the raw methods on
}

// NewInboxExample creates a new instance of InboxExample, bound to a specific deployed contract.
func NewInboxExample(address common.Address, backend bind.ContractBackend) (*InboxExample, error) {
	contract, err := bindInboxExample(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &InboxExample{InboxExampleCaller: InboxExampleCaller{contract: contract}, InboxExampleTransactor: InboxExampleTransactor{contract: contract}, InboxExampleFilterer: InboxExampleFilterer{contract: contract}}, nil
}

// NewInboxExampleCaller creates a new read-only instance of InboxExample, bound to a specific deployed contract.
func NewInboxExampleCaller(address common.Address, caller bind.ContractCaller) (*InboxExampleCaller, error) {
	contract, err := bindInboxExample(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &InboxExampleCaller{contract: contract}, nil
}

// NewInboxExampleTransactor creates a new write-only instance of InboxExample, bound to a specific deployed contract.
func NewInboxExampleTransactor(address common.Address, transactor bind.ContractTransactor) (*InboxExampleTransactor, error) {
	contract, err := bindInboxExample(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &InboxExampleTransactor{contract: contract}, nil
}

// NewInboxExampleFilterer creates a new log filterer instance of InboxExample, bound to a specific deployed contract.
func NewInboxExampleFilterer(address common.Address, filterer bind.ContractFilterer) (*InboxExampleFilterer, error) {
	contract, err := bindInboxExample(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &InboxExampleFilterer{contract: contract}, nil
}

// bindInboxExample binds a generic wrapper to an already deployed contract.
func bindInboxExample(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := abi.JSON(strings.NewReader(InboxExampleABI))
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_InboxExample *InboxExampleRaw) Call(opts *bind.CallOpts, result interface{}, method string, params ...interface{}) error {
	return _InboxExample.Contract.InboxExampleCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_InboxExample *InboxExampleRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _InboxExample.Contract.InboxExampleTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_InboxExample *InboxExampleRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _InboxExample.Contract.InboxExampleTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_InboxExample *InboxExampleCallerRaw) Call(opts *bind.CallOpts, result interface{}, method string, params ...interface{}) error {
	return _InboxExample.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_InboxExample *InboxExampleTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _InboxExample.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_InboxExample *InboxExampleTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _InboxExample.Contract.contract.Transact(opts, method, params...)
}

// Message is a free data retrieval call binding the contract method 0xe21f37ce.
//
// Solidity: function message() constant returns(string)
func (_InboxExample *InboxExampleCaller) Message(opts *bind.CallOpts) (string, error) {
	var (
		ret0 = new(string)
	)
	out := ret0
	err := _InboxExample.contract.Call(opts, out, "message")
	return *ret0, err
}

// Message is a free data retrieval call binding the contract method 0xe21f37ce.
//
// Solidity: function message() constant returns(string)
func (_InboxExample *InboxExampleSession) Message() (string, error) {
	return _InboxExample.Contract.Message(&_InboxExample.CallOpts)
}

// Message is a free data retrieval call binding the contract method 0xe21f37ce.
//
// Solidity: function message() constant returns(string)
func (_InboxExample *InboxExampleCallerSession) Message() (string, error) {
	return _InboxExample.Contract.Message(&_InboxExample.CallOpts)
}

// Inbox is a paid mutator transaction binding the contract method 0xd4a8d9ba.
//
// Solidity: function Inbox(string initialMessage) returns()
func (_InboxExample *InboxExampleTransactor) Inbox(opts *bind.TransactOpts, initialMessage string) (*types.Transaction, error) {
	return _InboxExample.contract.Transact(opts, "Inbox", initialMessage)
}

// Inbox is a paid mutator transaction binding the contract method 0xd4a8d9ba.
//
// Solidity: function Inbox(string initialMessage) returns()
func (_InboxExample *InboxExampleSession) Inbox(initialMessage string) (*types.Transaction, error) {
	return _InboxExample.Contract.Inbox(&_InboxExample.TransactOpts, initialMessage)
}

// Inbox is a paid mutator transaction binding the contract method 0xd4a8d9ba.
//
// Solidity: function Inbox(string initialMessage) returns()
func (_InboxExample *InboxExampleTransactorSession) Inbox(initialMessage string) (*types.Transaction, error) {
	return _InboxExample.Contract.Inbox(&_InboxExample.TransactOpts, initialMessage)
}

// SetMessage is a paid mutator transaction binding the contract method 0x368b8772.
//
// Solidity: function setMessage(string newMessage) returns()
func (_InboxExample *InboxExampleTransactor) SetMessage(opts *bind.TransactOpts, newMessage string) (*types.Transaction, error) {
	return _InboxExample.contract.Transact(opts, "setMessage", newMessage)
}

// SetMessage is a paid mutator transaction binding the contract method 0x368b8772.
//
// Solidity: function setMessage(string newMessage) returns()
func (_InboxExample *InboxExampleSession) SetMessage(newMessage string) (*types.Transaction, error) {
	return _InboxExample.Contract.SetMessage(&_InboxExample.TransactOpts, newMessage)
}

// SetMessage is a paid mutator transaction binding the contract method 0x368b8772.
//
// Solidity: function setMessage(string newMessage) returns()
func (_InboxExample *InboxExampleTransactorSession) SetMessage(newMessage string) (*types.Transaction, error) {
	return _InboxExample.Contract.SetMessage(&_InboxExample.TransactOpts, newMessage)
}
