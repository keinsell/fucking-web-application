@react.component
let default = () => {
  <div className="grid grid-rows-[auto_1fr] min-h-screen">
  <NavigationBar />
  <div className="grid grid-rows-[20px_1fr_20px] items-center justify-items-center min-h-screen p-8 pb-20 gap-16 sm:p-20 font-[family-name:var(--font-geist-sans)]">
      <main className="flex flex-col gap-[32px] row-start-2 items-center sm:items-start">
        <Next.Image
          className="dark:invert"
          src="/next.svg"
          alt="Next.js logo"
          width=180.0
          height=38.0
          priority=true
        />
        <ol className="list-inside list-decimal text-sm/6 text-center sm:text-left font-[family-name:var(--font-geist-mono)]">
          <li className="mb-2 tracking-[-.01em]">
            {React.string("Get started by editing ")}
            <code className="bg-black/[.05] dark:bg-white/[.06] px-1 py-0.5 rounded font-[family-name:var(--font-geist-mono)] font-semibold">
              {React.string("src/app/page.res")}
            </code>
            {React.string(".")}
          </li>
          <li className="tracking-[-.01em]">
            {React.string("Save and see your changes instantly.")}
          </li>
        </ol>

        <div className="flex gap-4 items-center flex-col sm:flex-row">
          <Next.Link href="https://vercel.com/new?utm_source=create-next-app&utm_medium=appdir-template-tw&utm_campaign=create-next-app">
            <p className="rounded-full border border-solid border-transparent transition-colors flex items-center justify-center bg-foreground text-background gap-2 hover:bg-[#383838] dark:hover:bg-[#ccc] font-medium text-sm sm:text-base h-10 sm:h-12 px-4 sm:px-5 sm:w-auto" target="_blank" rel="noopener noreferrer">
              <Next.Image
                className="dark:invert"
                src="/vercel.svg"
                alt="Vercel logomark"
                width=20.0
                height=20.0
              />
              {React.string("Deploy now")}
            </p>
          </Next.Link>
          <Next.Link href="https://nextjs.org/docs?utm_source=create-next-app&utm_medium=appdir-template-tw&utm_campaign=create-next-app">
            <p className="rounded-full border border-solid border-black/[.08] dark:border-white/[.145] transition-colors flex items-center justify-center hover:bg-[#f2f2f2] dark:hover:bg-[#1a1a1a] hover:border-transparent font-medium text-sm sm:text-base h-10 sm:h-12 px-4 sm:px-5 w-full sm:w-auto md:w-[158px]" target="_blank" rel="noopener noreferrer">
              {React.string("Read our docs")}
            </p>
          </Next.Link>
        </div>
      </main>
      <footer className="row-start-3 flex gap-[24px] flex-wrap items-center justify-center">
        <a className="flex items-center gap-2 hover:underline hover:underline-offset-4" href="https://nextjs.org/learn?utm_source=create-next-app&utm_medium=appdir-template-tw&utm_campaign=create-next-app" target="_blank" rel="noopener noreferrer">
          <Next.Image
            src="/file.svg"
            alt="File icon"
            width=16.0
            height=16.0
          />
          {React.string("Learn")}
        </a>
        <a className="flex items-center gap-2 hover:underline hover:underline-offset-4" href="https://vercel.com/templates?framework=next.js&utm_source=create-next-app&utm_medium=appdir-template-tw&utm_campaign=create-next-app" target="_blank" rel="noopener noreferrer">
          <Next.Image
            src="/window.svg"
            alt="Window icon"
            width=16.0
            height=16.0
          />
          {React.string("Examples")}
        </a>
        <a className="flex items-center gap-2 hover:underline hover:underline-offset-4" href="https://nextjs.org?utm_source=create-next-app&utm_medium=appdir-template-tw&utm_campaign=create-next-app" target="_blank" rel="noopener noreferrer">
          <Next.Image
            src="/globe.svg"
            alt="Globe icon"
            width=16.0
            height=16.0
          />
          {React.string("Go to nextjs.org →")}
        </a>
      </footer>
    </div>
  </div>
}
