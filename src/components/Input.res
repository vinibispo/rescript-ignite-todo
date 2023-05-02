@module("./Input.module.css") external styles: {..} = "default"
@react.component
let make = (~value, ~onChange, ~required, ~onInvalid, ~name, ~placeholder) => {
  <input value onChange required onInvalid className={styles["main"]} name placeholder />
}
