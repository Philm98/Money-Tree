
// connect to Moralis server
const serverUrl = "https://47dphsm4sfpy.usemoralis.com:2053/server";
const appId = "K3JGi1Tp2cS7IRu4WvGUI954C29oDl9Htl3ekJjv";
Moralis.start({ serverUrl, appId });

// add from here down
async function login() {
    let user = Moralis.User.current();
    if (!user) {
        user = await Moralis.authenticate();
        $("#btn-login").hide();
        $("#btn-logout").show();

    } 
}
async function logOut() {
    await Moralis.User.logOut();
    $("#btn-login").show();
    $("#btn-logout").hide();


}

// TODO: image not parseing correctly, image not showing
async function initializeApp() {
    const options = { address: "0x64bceF49758C950eEf914D410E13F5787810b971", chain: "mumbai" };
    let NFTs = await Moralis.Web3API.token.getAllTokenIds(options);
    console.log(NFTs); 
}


document.getElementById("btn-login").onclick = login;
document.getElementById("btn-logout").onclick = logOut;

initializeApp();


