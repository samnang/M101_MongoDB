<!DOCTYPE html>
<html>
  <head>
    <title>Hello World!</title>
  </head>
  <body>
    <p>
      Welcome {{username}}
    </p>
    <ul>
      %for thing in things:
        <li>{{thing}}</li>
      %end
    </ul>
    <form action="/favorite_fruit" method="POST">
      What is your favorite fruit?
      <input name="fruit" />
      <input type="submit" />
    </form>
  </body>
</html>
