@module("./Task.module.css") external styles: {..} = "default"

@react.component
let make = (~id, ~text, ~done) => {
  let {selectTask, deleteTask} = UseTasksHook.useTasks()
  <div className={done ? styles["complete"] : styles["main"]}>
    <button className={styles["checkButton"]} onClick={_ => selectTask(id)}>
      {done ? <PhosphorReact.Check size={24} /> : React.null}
    </button>
    <span> {text->React.string} </span>
    <button className={styles["deleteButton"]} onClick={_ => deleteTask(id)}>
      <PhosphorReact.Trash size={24} />
    </button>
  </div>
}
