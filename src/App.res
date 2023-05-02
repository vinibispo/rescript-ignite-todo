%%raw("import './global.css'")
@module("./App.module.css") external styles: {..} = "default"

@react.component
let make = () => {
  let (text, setText) = React.useState(() => "")
  let handleInputChange = e => {
    let input = ReactEvent.Synthetic.target(e)
    input["checkValidity"](.)->ignore
    let value = input["value"]
    setText(_ => value)
  }

  let handleInputValidity = e => {
    let input = ReactEvent.Synthetic.target(e)
    input["setCustomValidity"](. "Por favor, insira uma tarefa válida")
  }
  <div className={styles["wrapper"]}>
    <Header />
    <main className={styles["content"]}>
      <div>
        <Input
          name="task"
          placeholder="Adicione uma nova tarefa"
          onChange={handleInputChange}
          value={text}
          onInvalid={handleInputValidity}
          required={true}
        />
        <Button onClick={_ => Js.log("Clicked")}>
          <React.Fragment>
            {"Criar "->React.string}
            <PhosphorReact.PlusCircle size={15} />
          </React.Fragment>
        </Button>
      </div>
    </main>
  </div>
}
