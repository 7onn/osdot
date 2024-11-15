const metaTag = document.querySelector('meta[name="awsc-session-data"]');
const content = metaTag.getAttribute('content');
const sessionData = JSON.parse(content);
const accountId = sessionData.accountId;

color = accountColors[accountId];
if (!color) {
  console.log("Account color not found");
} else {
  setTimeout(() => {
    document.querySelector("#awsc-top-level-nav").style.backgroundColor = color;
  }, 1000 * 5)
}


