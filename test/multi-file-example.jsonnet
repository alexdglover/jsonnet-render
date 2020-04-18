local people = {
  person1: {
    name: "Alice",
    welcome: "Hello " + self.name + "!",
  },
  person2: self.person1 { name: "Bob" },
};

{
  'output1.json': people.person1,
  'output2.json': people.person2
}
