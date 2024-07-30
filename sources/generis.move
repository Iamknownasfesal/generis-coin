module generis::generis {
    use sui::coin;

    public struct GENERIS has drop {}
    
    #[lint_allow(share_owned)]
    fun init(witness: GENERIS, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<GENERIS>(
            witness,
            9,
            b"GENERIS",
            b"GENERIS",
            b"GENERIS",
            option::none(),
            ctx,
        );

        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
        transfer::public_share_object(metadata);
    }

    #[test_only]
    public fun init_for_testing(ctx: &mut TxContext) {
        init(GENERIS {}, ctx);
    }
}