requires "Data::Object" => "0.60";
requires "Readonly" => "2.00";
requires "perl" => "v5.14.0";

on 'test' => sub {
  requires "Data::Object" => "0.60";
  requires "Readonly" => "2.00";
  requires "perl" => "v5.14.0";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
};
