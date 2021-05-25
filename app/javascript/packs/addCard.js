const addCard = () => {
    console.log("how do I get the index for last line???")
    
    addCardButton.addEventListener("click", () => {
        console.log(index)
        document.getElementById("nested-cards-table").innerHTML += row
    })
}

const addCardButton = document.getElementById("add-card-button")
const index = document.getElementById("nested-cards-table").querySelectorAll("tr").length
const row = `
    <tr key=${index}>
        <td>
            <input type="text" value="" name="deck[cards_attributes][${index}][english]" id="deck_cards_attributes_${index}_english">
        </td>
        <td>
            <input type="text" value="" name="deck[cards_attributes][${index}][spanish]" id="deck_cards_attributes_${index}_spanish">
        </td>
    </tr>
`
export { addCard }