let $newline := "
",
$result := (document("booksales.xml")/booksales/Authors/Author)
  return
    (<table>
{for $x in ($result)
      return (<tr>{
        for $y in ($x/ID) return (<td><b>{children($y)}</b></td>)}</tr>,
        $newline)
}</table>,$newline)
