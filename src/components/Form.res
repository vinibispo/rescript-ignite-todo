@module("./Form.module.css") external styles: {..} = "default"
@react.component
let make = () => {
  let (text, setText) = React.useState(() => "")
  let {addTask} = UseTasksHook.useTasks()

  let handleInputChange = e => {
    let input = ReactEvent.Synthetic.target(e)
    input["setCustomValidity"](. "")->ignore
    let value = input["value"]
    setText(_ => value)
  }

  let handleSubmitForm = e => {
    ReactEvent.Synthetic.preventDefault(e)
    addTask(text)
    setText(_ => "")
  }

  let handleInputValidity = e => {
    let input = ReactEvent.Synthetic.target(e)
    input["setCustomValidity"](. "Por favor, insira uma tarefa válida")
  }
  <form className={styles["form"]} onSubmit={handleSubmitForm}>
    <Input
      name="task"
      placeholder="Adicione uma nova tarefa"
      onChange={handleInputChange}
      value={text}
      onInvalid={handleInputValidity}
      required={true}
    />
    <Button type_="submit">
      <React.Fragment>
        {"Criar "->React.string}
        <PhosphorReact.PlusCircle size={15} />
      </React.Fragment>
    </Button>
  </form>
}
