// format the date in a good way
export default function dateFormat (date) {
  return new Date(date).toLocaleString('en-US', { year: 'numeric', month: 'long', day: 'numeric' })
  
}
