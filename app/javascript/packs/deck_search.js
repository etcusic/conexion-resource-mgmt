// ALTERNATE SEARCH FILTER USING element.hidden INSTEAD OF SENDING DATA BACK TO CONTROLLER

document.getElementById("search-button").addEventListener('click', () => {
    const admin = document.getElementById("admin-select").value
    const level = document.getElementById("level-select").value
    const user = document.getElementById("user-select").value
    const deckRows = document.querySelectorAll(".deck-row")

    if (![admin, level, user].every(value => value === "All")){
        // filter through rows
        // check if value does not equal select value and 
        deckRows.forEach(deckRow => {
            let tdAdmin = deckRow.querySelector(".deck-admin").innerHTML
            let tdLevel = deckRow.querySelector(".deck-level").innerHTML
            let tdUser = deckRow.querySelector(".deck-user").dataset.userId
            let nestedArray = [[admin, tdAdmin], [level, tdLevel], [user, tdUser]]
            nestedArray.every(arr => checkValues(arr)) ? deckRow.hidden = false : deckRow.hidden = true
        })
    }
})

function checkValues(arr){
    if (arr[0] === "All" || arr[0] === arr[1]){
        return true
    } else {
        return false
    }
}
