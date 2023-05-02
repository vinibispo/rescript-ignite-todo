@module("./List.module.css") external styles: {..} = "default"

@module("uuid") external uuid: unit => string = "v4"

@react.component
let make = () => {
  let (text, setText) = React.useState(() => "")

  let (tasks, setTasks) = React.useState(() => [])
  let handleInputChange = e => {
    let input = ReactEvent.Synthetic.target(e)
    input["checkValidity"](.)->ignore
    let value = input["value"]
    setText(_ => value)
  }

  let handleSubmitForm = e => {
    ReactEvent.Synthetic.preventDefault(e)
    let newTask: ListContent.task = {
      id: uuid(),
      text,
      done: false,
    }
    setTasks(tasks => tasks->Belt.Array.concat([newTask]))
  }

  let onDelete = id => {
    setTasks(tasks => tasks->Belt.Array.keep(task => task.id !== id))
  }

  let onSelect = id => {
    setTasks(tasks =>
      tasks->Belt.Array.map(task =>
        if task.id === id {
          {...task, done: !task.done}
        } else {
          task
        }
      )
    )
  }

  let handleInputValidity = e => {
    let input = ReactEvent.Synthetic.target(e)
    input["setCustomValidity"](. "Por favor, insira uma tarefa válida")
  }
  <div className={styles["main"]}>
    <header className={styles["header"]}>
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
    </header>
    <ListContent tasks onDelete onSelect />
  </div>
}
