import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    port: 3000
  },
  test: {
    include: ["tests/**/*.bs.js"],
    globals: true,
    environment: 'jsdom',
    setupFiles: './scripts/setup.js'
  }
})
