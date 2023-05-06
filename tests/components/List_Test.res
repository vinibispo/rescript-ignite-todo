open Vitest

describe("List", _ => {

  test("renders the list component without crash", _ => {
    TestingLibrary.React.render(
      <UseTasksHook.Provider>
        <List />
      </UseTasksHook.Provider>
    )->ignore

    open Expect

    expect(TestingLibrary.Dom.screen->TestingLibrary.Dom.ByText.get("Crie tarefas e organize seus itens a fazer"))->toBeInTheDocument
  })
})
