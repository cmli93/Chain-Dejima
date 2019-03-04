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

// MetadataABI is the input ABI used to generate the binding from.
const MetadataABI = "[{\"constant\":false,\"inputs\":[{\"name\":\"_dejimaName\",\"type\":\"string\"},{\"name\":\"_numOfAttriToBeUpdated\",\"type\":\"uint256\"}],\"name\":\"checkUpdatePermission\",\"outputs\":[],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[],\"name\":\"owner\",\"outputs\":[{\"name\":\"\",\"type\":\"address\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[],\"name\":\"grantPermission\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[],\"name\":\"dejima\",\"outputs\":[{\"name\":\"dejimaName\",\"type\":\"string\"},{\"name\":\"lastUpdateTime\",\"type\":\"string\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"constructor\"}]"

// MetadataBin is the compiled bytecode used for deploying new contracts.
const MetadataBin = `0x60806040523480156200001157600080fd5b506000805461010060a860020a03191633610100021760ff19169055604080516002808252606080830184529260208301908038833901905050905073cdce1eae7080f2450ea4f8637da5ce21f31718ac8160008151811015156200007257fe5b600160a060020a03909216602092830290910190910152805173736b60dfc85b7063c01ecf912e00cb83678d386e9082906001908110620000af57fe5b600160a060020a03909216602092830290910190910152620000d06200022b565b506040805160c080820183526000608083810182815260a0808601849052908552855180870187526001808252602082810195909552848701919091528651808801885281815280850182905286880152865180880188528181528085018290526060808801919091528751958601885260129386019384527f64656a696d615f646f6374616e64706174690000000000000000000000000000928601929092529184528383018790528386018590528551808701909652600886527f3230313930323231000000000000000000000000000000000000000000000000868401528301949094528151805193949293620001ce92849201906200025d565b506020828101518051620001e99260018501920190620002e2565b50604082015162000201906002830190600462000348565b50606082015180516200021f9160068401916020909101906200025d565b509050505050620004dc565b610100604051908101604052806004905b6200024662000395565b8152602001906001900390816200023c5790505090565b828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f10620002a057805160ff1916838001178555620002d0565b82800160010185558215620002d0579182015b82811115620002d0578251825591602001919060010190620002b3565b50620002de929150620003b0565b5090565b8280548282559060005260206000209081019282156200033a579160200282015b828111156200033a5782518254600160a060020a031916600160a060020a0390911617825560209092019160019091019062000303565b50620002de929150620003d0565b826004810192821562000387579160200282015b8281111562000387578251620003769083906002620003f7565b50916020019190600101906200035c565b50620002de9291506200048c565b60408051808201825290600290829080388339509192915050565b620003cd91905b80821115620002de5760008155600101620003b7565b90565b620003cd91905b80821115620002de578054600160a060020a0319168155600101620003d7565b6001830191839082156200047e5791602002820160005b838211156200044d57835183826101000a81548160ff02191690831515021790555092602001926001016020816000010492830192600103026200040e565b80156200047c5782816101000a81549060ff02191690556001016020816000010492830192600103026200044d565b505b50620002de929150620004b4565b620003cd91905b80821115620002de576000620004aa8282620004d5565b5060010162000493565b620003cd91905b80821115620002de57805460ff19168155600101620004bb565b5060009055565b61055980620004ec6000396000f3fe608060405234801561001057600080fd5b5060043610610068577c010000000000000000000000000000000000000000000000000000000060003504630b695b95811461006d5780638da5cb5b14610082578063b8bc835c146100a0578063d224d4b1146100b5575b600080fd5b61008061007b366004610361565b6100cb565b005b61008a6101af565b6040516100979190610402565b60405180910390f35b6100a86101d0565b6040516100979190610416565b6100bd6101d9565b604051610097929190610424565b6000805460ff191681556002805433929081106100e457fe5b60009182526020909120015473ffffffffffffffffffffffffffffffffffffffff8281169116141561013f576003826004811061011d57fe5b015460ff1615156001141561013a576000805460ff191660011790555b6101aa565b60028054600190811061014e57fe5b60009182526020909120015473ffffffffffffffffffffffffffffffffffffffff828116911614156101aa576003826004811061018757fe5b015460ff610100909104161515600114156101aa576000805460ff191660011790555b505050565b600054610100900473ffffffffffffffffffffffffffffffffffffffff1681565b60005460ff1681565b60018054604080516020601f6002600019610100878916150201909516949094049384018190048102820181019092528281529183918301828280156102605780601f1061023557610100808354040283529160200191610260565b820191906000526020600020905b81548152906001019060200180831161024357829003601f168201915b5050505060068301805460408051602060026001851615610100026000190190941693909304601f81018490048402820184019092528181529495949350908301828280156102f05780601f106102c5576101008083540402835291602001916102f0565b820191906000526020600020905b8154815290600101906020018083116102d357829003601f168201915b5050505050905082565b6000601f8201831361030b57600080fd5b813561031e61031982610478565b610451565b9150808252602083016020830185838301111561033a57600080fd5b6103458382846104d9565b50505092915050565b600061035a82356104d6565b9392505050565b6000806040838503121561037457600080fd5b823567ffffffffffffffff81111561038b57600080fd5b610397858286016102fa565b92505060206103a88582860161034e565b9150509250929050565b6103bb816104ad565b82525050565b6103bb816104b8565b60006103d5826104a0565b6103df81856104a4565b93506103ef8185602086016104e5565b6103f881610515565b9093019392505050565b6020810161041082846103b2565b92915050565b6020810161041082846103c1565b6040808252810161043581856103ca565b9050818103602083015261044981846103ca565b949350505050565b60405181810167ffffffffffffffff8111828210171561047057600080fd5b604052919050565b600067ffffffffffffffff82111561048f57600080fd5b506020601f91909101601f19160190565b5190565b90815260200190565b6000610410826104bd565b151590565b73ffffffffffffffffffffffffffffffffffffffff1690565b90565b82818337506000910152565b60005b838110156105005781810151838201526020016104e8565b8381111561050f576000848401525b50505050565b601f01601f19169056fea265627a7a7230582007e9a04171d810893ce2862ba9f14b5a07cbbb04f8230a23170b819b605807c36c6578706572696d656e74616cf50037`

// DeployMetadata deploys a new Ethereum contract, binding an instance of Metadata to it.
func DeployMetadata(auth *bind.TransactOpts, backend bind.ContractBackend) (common.Address, *types.Transaction, *Metadata, error) {
	parsed, err := abi.JSON(strings.NewReader(MetadataABI))
	if err != nil {
		return common.Address{}, nil, nil, err
	}
	address, tx, contract, err := bind.DeployContract(auth, parsed, common.FromHex(MetadataBin), backend)
	if err != nil {
		return common.Address{}, nil, nil, err
	}
	return address, tx, &Metadata{MetadataCaller: MetadataCaller{contract: contract}, MetadataTransactor: MetadataTransactor{contract: contract}, MetadataFilterer: MetadataFilterer{contract: contract}}, nil
}

// Metadata is an auto generated Go binding around an Ethereum contract.
type Metadata struct {
	MetadataCaller     // Read-only binding to the contract
	MetadataTransactor // Write-only binding to the contract
	MetadataFilterer   // Log filterer for contract events
}

// MetadataCaller is an auto generated read-only Go binding around an Ethereum contract.
type MetadataCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// MetadataTransactor is an auto generated write-only Go binding around an Ethereum contract.
type MetadataTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// MetadataFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type MetadataFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// MetadataSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type MetadataSession struct {
	Contract     *Metadata         // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// MetadataCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type MetadataCallerSession struct {
	Contract *MetadataCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts   // Call options to use throughout this session
}

// MetadataTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type MetadataTransactorSession struct {
	Contract     *MetadataTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts   // Transaction auth options to use throughout this session
}

// MetadataRaw is an auto generated low-level Go binding around an Ethereum contract.
type MetadataRaw struct {
	Contract *Metadata // Generic contract binding to access the raw methods on
}

// MetadataCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type MetadataCallerRaw struct {
	Contract *MetadataCaller // Generic read-only contract binding to access the raw methods on
}

// MetadataTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type MetadataTransactorRaw struct {
	Contract *MetadataTransactor // Generic write-only contract binding to access the raw methods on
}

// NewMetadata creates a new instance of Metadata, bound to a specific deployed contract.
func NewMetadata(address common.Address, backend bind.ContractBackend) (*Metadata, error) {
	contract, err := bindMetadata(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &Metadata{MetadataCaller: MetadataCaller{contract: contract}, MetadataTransactor: MetadataTransactor{contract: contract}, MetadataFilterer: MetadataFilterer{contract: contract}}, nil
}

// NewMetadataCaller creates a new read-only instance of Metadata, bound to a specific deployed contract.
func NewMetadataCaller(address common.Address, caller bind.ContractCaller) (*MetadataCaller, error) {
	contract, err := bindMetadata(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &MetadataCaller{contract: contract}, nil
}

// NewMetadataTransactor creates a new write-only instance of Metadata, bound to a specific deployed contract.
func NewMetadataTransactor(address common.Address, transactor bind.ContractTransactor) (*MetadataTransactor, error) {
	contract, err := bindMetadata(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &MetadataTransactor{contract: contract}, nil
}

// NewMetadataFilterer creates a new log filterer instance of Metadata, bound to a specific deployed contract.
func NewMetadataFilterer(address common.Address, filterer bind.ContractFilterer) (*MetadataFilterer, error) {
	contract, err := bindMetadata(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &MetadataFilterer{contract: contract}, nil
}

// bindMetadata binds a generic wrapper to an already deployed contract.
func bindMetadata(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := abi.JSON(strings.NewReader(MetadataABI))
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_Metadata *MetadataRaw) Call(opts *bind.CallOpts, result interface{}, method string, params ...interface{}) error {
	return _Metadata.Contract.MetadataCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_Metadata *MetadataRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _Metadata.Contract.MetadataTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_Metadata *MetadataRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _Metadata.Contract.MetadataTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_Metadata *MetadataCallerRaw) Call(opts *bind.CallOpts, result interface{}, method string, params ...interface{}) error {
	return _Metadata.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_Metadata *MetadataTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _Metadata.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_Metadata *MetadataTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _Metadata.Contract.contract.Transact(opts, method, params...)
}

// Dejima is a free data retrieval call binding the contract method 0xd224d4b1.
//
// Solidity: function dejima() constant returns(string dejimaName, string lastUpdateTime)
func (_Metadata *MetadataCaller) Dejima(opts *bind.CallOpts) (struct {
	DejimaName     string
	LastUpdateTime string
}, error) {
	ret := new(struct {
		DejimaName     string
		LastUpdateTime string
	})
	out := ret
	err := _Metadata.contract.Call(opts, out, "dejima")
	return *ret, err
}

// Dejima is a free data retrieval call binding the contract method 0xd224d4b1.
//
// Solidity: function dejima() constant returns(string dejimaName, string lastUpdateTime)
func (_Metadata *MetadataSession) Dejima() (struct {
	DejimaName     string
	LastUpdateTime string
}, error) {
	return _Metadata.Contract.Dejima(&_Metadata.CallOpts)
}

// Dejima is a free data retrieval call binding the contract method 0xd224d4b1.
//
// Solidity: function dejima() constant returns(string dejimaName, string lastUpdateTime)
func (_Metadata *MetadataCallerSession) Dejima() (struct {
	DejimaName     string
	LastUpdateTime string
}, error) {
	return _Metadata.Contract.Dejima(&_Metadata.CallOpts)
}

// GrantPermission is a free data retrieval call binding the contract method 0xb8bc835c.
//
// Solidity: function grantPermission() constant returns(bool)
func (_Metadata *MetadataCaller) GrantPermission(opts *bind.CallOpts) (bool, error) {
	var (
		ret0 = new(bool)
	)
	out := ret0
	err := _Metadata.contract.Call(opts, out, "grantPermission")
	return *ret0, err
}

// GrantPermission is a free data retrieval call binding the contract method 0xb8bc835c.
//
// Solidity: function grantPermission() constant returns(bool)
func (_Metadata *MetadataSession) GrantPermission() (bool, error) {
	return _Metadata.Contract.GrantPermission(&_Metadata.CallOpts)
}

// GrantPermission is a free data retrieval call binding the contract method 0xb8bc835c.
//
// Solidity: function grantPermission() constant returns(bool)
func (_Metadata *MetadataCallerSession) GrantPermission() (bool, error) {
	return _Metadata.Contract.GrantPermission(&_Metadata.CallOpts)
}

// Owner is a free data retrieval call binding the contract method 0x8da5cb5b.
//
// Solidity: function owner() constant returns(address)
func (_Metadata *MetadataCaller) Owner(opts *bind.CallOpts) (common.Address, error) {
	var (
		ret0 = new(common.Address)
	)
	out := ret0
	err := _Metadata.contract.Call(opts, out, "owner")
	return *ret0, err
}

// Owner is a free data retrieval call binding the contract method 0x8da5cb5b.
//
// Solidity: function owner() constant returns(address)
func (_Metadata *MetadataSession) Owner() (common.Address, error) {
	return _Metadata.Contract.Owner(&_Metadata.CallOpts)
}

// Owner is a free data retrieval call binding the contract method 0x8da5cb5b.
//
// Solidity: function owner() constant returns(address)
func (_Metadata *MetadataCallerSession) Owner() (common.Address, error) {
	return _Metadata.Contract.Owner(&_Metadata.CallOpts)
}

// CheckUpdatePermission is a paid mutator transaction binding the contract method 0x0b695b95.
//
// Solidity: function checkUpdatePermission(string _dejimaName, uint256 _numOfAttriToBeUpdated) returns()
func (_Metadata *MetadataTransactor) CheckUpdatePermission(opts *bind.TransactOpts, _dejimaName string, _numOfAttriToBeUpdated *big.Int) (*types.Transaction, error) {
	return _Metadata.contract.Transact(opts, "checkUpdatePermission", _dejimaName, _numOfAttriToBeUpdated)
}

// CheckUpdatePermission is a paid mutator transaction binding the contract method 0x0b695b95.
//
// Solidity: function checkUpdatePermission(string _dejimaName, uint256 _numOfAttriToBeUpdated) returns()
func (_Metadata *MetadataSession) CheckUpdatePermission(_dejimaName string, _numOfAttriToBeUpdated *big.Int) (*types.Transaction, error) {
	return _Metadata.Contract.CheckUpdatePermission(&_Metadata.TransactOpts, _dejimaName, _numOfAttriToBeUpdated)
}

// CheckUpdatePermission is a paid mutator transaction binding the contract method 0x0b695b95.
//
// Solidity: function checkUpdatePermission(string _dejimaName, uint256 _numOfAttriToBeUpdated) returns()
func (_Metadata *MetadataTransactorSession) CheckUpdatePermission(_dejimaName string, _numOfAttriToBeUpdated *big.Int) (*types.Transaction, error) {
	return _Metadata.Contract.CheckUpdatePermission(&_Metadata.TransactOpts, _dejimaName, _numOfAttriToBeUpdated)
}
