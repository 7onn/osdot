const metaTag = document.querySelector('meta[name="awsc-session-data"]')
const content = metaTag.getAttribute('content')
const sessionData = JSON.parse(content)
const accountId = sessionData.accountId
const account = accounts[accountId];

if (!account) {
  console.log("Account not found")
} else {
  console.log(`Account: ${account.name} - ${account.color}`);

  setTimeout(() => {
    if (account.color) {
      const navBar = document.querySelector("#awsc-top-level-nav")
      navBar.style.backgroundColor = account.color
    }

    if (account.name) {
      document.querySelector(
        '[data-testid="awsc-nav-account-menu-button"]>span[title]'
      ).textContent = account.name;
    }
  }, 1000)
}

