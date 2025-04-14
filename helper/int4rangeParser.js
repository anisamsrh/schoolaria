function parseInt4Range(rangeStr) {
  // Hilangkan tanda kurung [ ) ] (
  const cleaned = rangeStr.replace(/[\[\]\(\)]/g, '');
  
  // Pisahkan dengan koma
  const [start, end] = cleaned.split(',').map(Number);

  return {
    lower: start,
    upper: end
  };
}

module.exports = {parseInt4Range}
