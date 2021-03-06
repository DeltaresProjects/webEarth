! Test the set_value and set_value_at_indices functions.
program set_value_test

  use bmi_heat
  use testing_helpers
  implicit none

  type (heat_model) :: m
  integer :: s, i, j, grid_id
  character (len=BMI_MAXVARNAMESTR), pointer :: names(:)
  integer :: dims(2), locations(3)
  real :: values(3)
  real, pointer :: z(:)
  character(len=30) :: rowfmt

  write (*,"(a)",advance="no") "Initializing..."
  s = initialize(m, "")
  write (*,*) "Done."

  s = get_output_var_names(m, names)
  write (*,"(a, a)") "Output variables: ", names

  s = get_var_grid(m, names(1), grid_id)
  s = get_grid_shape(m, grid_id, dims)
  write(rowfmt,'(a,i4,a)') '(', dims(2), '(1x,f6.1))'

  write (*, "(a)") "Initial values:"
  s = get_value(m, "plate_surface__temperature", z)
  call print_array(z, dims)

  write (*,"(a)",advance="no") "Setting new values..."
  z = 42.0
  s = set_value(m, "plate_surface__temperature", z)
  write (*,*) "Done."

  write (*, "(a)") "New values:"
  s = get_value(m, "plate_surface__temperature", z)
  call print_array(z, dims)

  write (*, "(a)") "Set values at three locations:"
  locations = (/21, 41, 62/)
  values = (/-1.0, -1.0, -1.0/)
  write (*,*) "Locations: ", locations
  write (*,*) "Values: ", values
  s = set_value_at_indices(m, "plate_surface__temperature", locations, values)

  write (*, "(a)") "New values:"
  s = get_value(m, "plate_surface__temperature", z)
  call print_array(z, dims)

end program set_value_test
