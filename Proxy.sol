pragma solidity ^0.5.0;

contract Proxy {
    constructor () public {}

    function fortune(address nostradamus) public returns (bool success) {
        bytes32 payload = keccak256(abi.encodePacked(this, block.number, blockhash(block.number), now, nostradamus));
        bytes32 me = 'blablacio';

        (bool ok,) = nostradamus.call(abi.encodeWithSignature('prophecise(bytes32,bytes32)', payload, me));

        require(ok);

        return true;
    }
}
