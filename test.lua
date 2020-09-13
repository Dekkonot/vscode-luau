function foo(): bar
function foo(): bar.baz
function foo(): (bar, baz)
function foo(): {[bar]: baz}
function foo(): bar<baz>
function foo(): bar<baz, qux>
function foo(): (bar, baz) -> qux
function foo(): bar<(baz, qux)> -> cat
function foo(): bar<(baz, qux)>

function foo(): bar baz
function foo(): bar.baz qux
function foo(): (bar, baz) qux
function foo(): {[bar]: baz} qux
function foo(): bar<baz> qux
function foo(): bar<baz, qux> cat
function foo(): (bar, baz) -> qux cat
function foo(): bar<(baz, qux)> -> cat dog
function foo(): bar<(baz, qux)> dog

local foo: bar do
local foo: bar.baz do
local foo: (bar, baz) do 
local foo: {[bar]: baz} do
local foo: bar<baz> do
local foo: bar<baz, qux> do
local foo: (bar, baz) -> qux do
local foo: bar<(baz, qux)> -> cat do
local foo: bar<(baz, qux)> do

local REAL: foo = "adsf" do
local REAL: foo<bar> = false do
local REAL: (foo, bar) -> qux = {1, 2, 3} do
local REAL: {[foo]: bar, baz: qux} = function() end do
local REAL: foo<bar, baz>; do
local REAL: foo<(bar, baz) -> qux>; do

local foo: bar baz do
local foo: bar.baz qux do
local foo: (bar, baz) qux do
local foo: {[bar]: baz} qux do
local foo: bar<baz> qux do
local foo: bar<baz, qux> cat do
local foo: (bar, baz) -> qux cat do
local foo: bar<(baz, qux)> -> cat do
local foo: bar<(baz, qux)> dog do