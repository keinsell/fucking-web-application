module NavigationBarLogo = {
  @react.component
  let make = () => {
    <Next.Link href="/">
      <span className="text-xl ml-2 align-middle font-semibold">
        <span className="text-black-800"> {React.string("Fcking ")} </span>
        <span className="text-orange-800"> {React.string("ReScript")} </span>
      </span>
    </Next.Link>
  }
}

module Navigation = {
  @react.component
  let make = () => {
    <nav className="p-2 h-12 flex border-b border-gray-200 justify-between items-center text-sm">
      <NavigationBarLogo />
      <div className="flex w-2/3 justify-end items-center">
      </div>
    </nav>
  }
}

let make = Navigation.make
