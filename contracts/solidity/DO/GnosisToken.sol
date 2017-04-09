pragma solidity 0.4.4;
import "Tokens/StandardToken.sol";


/// @title Gnosis token contract - Holds tokens of Gnosis.
/// @author Stefan George - <stefan.george@consensys.net>
contract GnosisToken is StandardToken {

    /*
     *  Token meta data
     */
    string constant public name = "Gnosis Token";
    string constant public symbol = "GNO";
    uint8 constant public decimals = 18;

    /*
     *  Public functions
     */
    /// @dev Contract constructor function sets dutch auction contract address and assigns all tokens to dutch auction.
    /// @param dutchAuction Address of dutch auction contract.
    /// @param owners Array of addresses receiving preassigned tokens.
    /// @param tokens Array of preassigned token amounts.
    function GnosisToken(address dutchAuction, address[] owners, uint[] tokens)
        public
    {
        totalSupply = 10000000 * 10**18;
        balances[dutchAuction] = 9000000 * 10**18;
        uint assignedTokens = balances[dutchAuction];
        for (uint i=0; i<owners.length; i++) {
            balances[owners[i]] += tokens[i];
            assignedTokens += tokens[i];
        }
        if (assignedTokens != totalSupply)
            throw;
    }
}
