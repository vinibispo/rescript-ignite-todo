@module("./Task.module.css") external styles: {..} = "default"

@react.component
let make = (~id, ~text, ~done, ~onSelect, ~onDelete) => {
  <div className={done ? styles["complete"] : styles["main"]}>
    <button className={styles["checkButton"]} onClick={_ => onSelect(id)}>
      {done ? <PhosphorReact.Check size={24} /> : React.null}
    </button>
    <span> {text->React.string} </span>
    <button className={styles["deleteButton"]} onClick={_ => onDelete(id)}>
      <PhosphorReact.Trash size={24} />
    </button>
  </div>
}
