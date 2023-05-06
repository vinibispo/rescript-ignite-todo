open Vitest

test("renders component without crashing", _ => {
  open TestingLibrary.Dom
  open Expect

  TestingLibrary.React.render(
    <UseTasksHook.Provider>
      <Form />
    </UseTasksHook.Provider>,
  )->ignore
  expect(screen->ByPlaceholderText.find("Adicione uma nova tarefa"))->Expect.toBeTruthy
  expect(screen->ByText.get("Criar")->Some)->toBeInTheDocument
})

testAsync("type a valid task", async _ => {
  open TestingLibrary.Dom
  open Expect
  TestingLibrary.React.render(
    <UseTasksHook.Provider>
      <Form />
    </UseTasksHook.Provider>,
  )->ignore

  let event = TestingLibrary.Event.setup()
  let taskInput = await screen->ByPlaceholderText.find("Adicione uma nova tarefa")
  let clickButton = await screen->ByText.find("Criar")

  await event->TestingLibrary.Event.type_(taskInput, "Nova tarefa")
  await event->TestingLibrary.Event.click(clickButton)

  expect(taskInput)->toHaveValue("")
})

testAsync("type an invalid task", async _ => {
  open TestingLibrary.Dom
  open Expect
  TestingLibrary.React.render(
    <UseTasksHook.Provider>
      <Form />
    </UseTasksHook.Provider>,
  )->ignore

  let event = TestingLibrary.Event.setup()
  let taskInput = await screen->ByPlaceholderText.find("Adicione uma nova tarefa")
  let clickButton = await screen->ByText.find("Criar")

  await event->TestingLibrary.Event.type_(taskInput, " ")
  expect(clickButton)->toBeDisabled
})
