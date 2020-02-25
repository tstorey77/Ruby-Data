require "application_system_test_case"

class PokedexesTest < ApplicationSystemTestCase
  setup do
    @pokedex = pokedexes(:one)
  end

  test "visiting the index" do
    visit pokedexes_url
    assert_selector "h1", text: "Pokedexes"
  end

  test "creating a Pokedex" do
    visit pokedexes_url
    click_on "New Pokedex"

    fill_in "Def", with: @pokedex.def
    fill_in "Hp", with: @pokedex.hp
    fill_in "Image", with: @pokedex.image
    fill_in "Name", with: @pokedex.name
    fill_in "Type", with: @pokedex.type
    click_on "Create Pokedex"

    assert_text "Pokedex was successfully created"
    click_on "Back"
  end

  test "updating a Pokedex" do
    visit pokedexes_url
    click_on "Edit", match: :first

    fill_in "Def", with: @pokedex.def
    fill_in "Hp", with: @pokedex.hp
    fill_in "Image", with: @pokedex.image
    fill_in "Name", with: @pokedex.name
    fill_in "Type", with: @pokedex.type
    click_on "Update Pokedex"

    assert_text "Pokedex was successfully updated"
    click_on "Back"
  end

  test "destroying a Pokedex" do
    visit pokedexes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pokedex was successfully destroyed"
  end
end
