function PlayerMovement:_stamina_percentage()
	return self._stamina / self:_max_stamina()
end